#!/usr/bin/env python
# coding: utf-8

import pandas as pd

from sqlalchemy import create_engine


engine = create_engine('postgresql://root:root@localhost:5432/ny_taxi')


df_iter = pd.read_csv('homework/green_tripdata_2019-09.csv', iterator=True, chunksize=100000)


df = next(df_iter)


df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)


df.head(n=0).to_sql(name="green_taxi_data", con=engine, if_exists='replace')


df.to_sql(name="green_taxi_data", con=engine, if_exists='append')


# In[35]:


while True:
    df = next(df_iter)
    
    df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
    df.lpep_dropoff_datetime =pd.to_datetime(df.lpep_dropoff_datetime)

    df.to_sql(name="green_taxi_data", con=engine, if_exists='append')


# In[36]:


df


# In[37]:


df = pd.read_csv('homework/taxi+_zone_lookup.csv')


# In[38]:


df


# In[41]:


df.head(n=0).to_sql(name="taxi_zones",con=engine,if_exists='replace')


# In[42]:


df.to_sql(name="taxi_zones",con=engine,if_exists='append')


# In[ ]:




