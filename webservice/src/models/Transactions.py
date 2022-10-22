from configuration.database import Db
from datetime import datetime, timedelta


class TransactionModel():

    def getSum():
        try:
            Db.cursor.execute(f"""
                Select
                    Sum(bcd_transactions.bcd_tra_amount) As total
                From
                    bcd_transactions
            """)
            result = Db.cursor.fetchall()
            return result
        except Exception as error:
            if (str(error) != 'no results to fetch'):
                error = f"[DB ERROR][transaction][getSum]: {error}"
                print(error)
            Db.conection.rollback()
            return False

    def registerTransaction(transactionType, date, amount, cpf, card, time, storeOwner, storeName):
        try:
            Db.cursor.execute(f"""
                INSERT INTO bcd_transactions (
                    bcd_tra_type, 
                    bcd_tra_date, 
                    bcd_tra_amount, 
                    bcd_tra_cpf, 
                    bcd_tra_card_number, 
                    bcd_tra_time, 
                    bcd_tra_store_owner, 
                    bcd_tra_store_name) 
                VALUES (
                    {transactionType}, 
                    '{date}', 
                    {amount}, 
                    '{cpf}', 
                    '{card}', 
                    '{time}', 
                    '{storeOwner}', 
                    '{storeName}')
                RETURNING
                    bcd_tra_id As code
            """)
            Db.conection.commit()
            result = Db.cursor.fetchall()
            return result
        except Exception as error:
            if (str(error) != 'no results to fetch'):
                error = f"[DB ERROR][transaction][registerTransaction]: {error}"
                print(error)
            Db.conection.rollback()
            return False

