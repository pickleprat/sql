from sqlalchemy import create_engine
import pandas as pd 
import os 

BASE_URL: str = "~/Desktop/datasets/ecommerce"

payments = pd.read_csv(
        os.path.join(BASE_URL, "Trans_dim.csv")
) 


items = pd.read_csv(
        os.path.join(BASE_URL, "item_dim.csv")
) 

engine_payments = create_engine(url = "mysql://root:susm@bemyW!fe@localhost/Payments") 
payments.to_sql("Payments", con=engine_payments, index=False, if_exists='append')  


