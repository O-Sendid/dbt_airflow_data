import psycopg2
import pandas as pd
import logging
import os
from pathlib import Path

logging.basicConfig(
    level=logging.INFO,
    handlers=[logging.StreamHandler()],
    format="%(asctime)s [%(levelname)s] %(message)s",
)

logger = logging.getLogger(__name__)


def get_conn():
    logger.info("Creating Database Connection...")
    conn = psycopg2.connect(
        database='dbt_database',
        user='dbt_user',
        password='dbt_password',
        host='postgres',
        port='5432',
    )

    cur = conn.cursor()
    logger.info("Connection to Database stablished")

    return conn, cur


if __name__ == "__main__":
    conn, cur = get_conn()

    logger.info("Creating tables...")

    with open(Path(__file__).resolve().parent / "sql/create_tables.sql", "r") as f:
        query = f.read()

    cur.execute(query)
    conn.commit()

    logger.info("Tables created")

    logger.info("Inserting data to DB...")

    #  Create file name to table name mapping
    files = {
        "jaffle_shop_customers.csv": "raw.customers",
        "jaffle_shop_orders.csv": "raw.orders",
        "stripe_payments.csv": "raw.payment",
    }

    for file in files.keys():
        tablename = files[file]
        data = pd.read_csv(Path(__file__).resolve().parent.parent / "data/{}".format(file))

        try:
            logger.info(
                "Uploading {} records to the table {}...".format(len(data), tablename)
            )
            args_str = b",".join(
                cur.mogrify("(" + "%s," * (len(data.columns) - 1) + "%s)", x)
                for x in tuple(map(tuple, data.values))
            )
            cur.execute(
                "INSERT INTO {} VALUES ".format(tablename) + args_str.decode("utf-8")
            )
            conn.commit()

            logger.info("{} uploaded to the Database".format(tablename))
        except Exception as e:
            logger.error("{}: {}".format(tablename, e))

    cur.close()
    conn.close()