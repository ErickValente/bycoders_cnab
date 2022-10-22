from configuration.database import Db
from datetime import datetime, timedelta


class AccessModel():

    def authenticationByLoginAndPass(login, password):
        try:
            Db.cursor.execute(f"""
                    Select
                        bcd_access.bcd_acc_id As code,
                        bcd_access.bcd_acc_name As name,
                        bcd_access.bcd_acc_login As login,
                        bcd_access.bcd_acc_password As password,
                        bcd_access.bcd_acc_token As token
                    From
                        bcd_access
                    Where
                        (bcd_access.bcd_acc_login = '{login}') And
                        (bcd_access.bcd_acc_password = '{password}')
            """)
            result = Db.cursor.fetchall()
            return result
        except Exception as error:
            if (str(error) != 'no results to fetch'):
                error = f"[DB ERROR][access][authenticationByLoginAndPass]: {error}"
                print(error)
            Db.conection.rollback()
            return False

    def newAccess(name, login, password):
        try:
            Db.cursor.execute(f"""
                INSERT INTO bcd_access (
                    bcd_acc_name, 
                    bcd_acc_login, 
                    bcd_acc_password, 
                    bcd_acc_token) 
                VALUES (
                    '{name}', 
                    '{login}', 
                    '{password}', 
                    MD5('{login}'))
                RETURNING
                        bcd_access.bcd_acc_id As code
            """)
            Db.conection.commit()
            result = Db.cursor.fetchall()
            return result
        except Exception as error:
            if (str(error) != 'no results to fetch'):
                error = f"[DB ERROR][access][newAccess]: {error}"
                print(error)
            Db.conection.rollback()
            return False

