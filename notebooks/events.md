# events notebook

This file contains the PySpark Notebook code in markdown format, rather than ipynb,
for easy copy-and-paste into your Notebook.

---

## Cell 1

### Code

```
# Read from Cosmos DB analytical store into a Spark DataFrame and display 10 rows from the DataFrame
# To select a preferred list of regions in a multi-region Cosmos DB account, add .option("spark.cosmos.preferredRegions", "<Region1>,<Region2>")

df = spark.read\
    .format("cosmos.olap")\
    .option("spark.synapse.linkedService", "CosmosDev")\
    .option("spark.cosmos.container", "events")\
    .load()

df.printSchema()
```

### Output

```
root
 |-- _rid: string (nullable = true)
 |-- _ts: long (nullable = true)
 |-- seq: long (nullable = true)
 |-- epoch: double (nullable = true)
 |-- device_type: string (nullable = true)
 |-- device_os: string (nullable = true)
 |-- device_version: string (nullable = true)
 |-- device_pid: long (nullable = true)
 |-- line_speed: long (nullable = true)
 |-- temperature: long (nullable = true)
 |-- humidity: long (nullable = true)
 |-- EventProcessedUtcTime: string (nullable = true)
 |-- PartitionId: long (nullable = true)
 |-- EventEnqueuedUtcTime: string (nullable = true)
 |-- IoTHub: struct (nullable = true)
 |    |-- MessageId: string (nullable = true)
 |    |-- CorrelationId: string (nullable = true)
 |    |-- ConnectionDeviceId: string (nullable = true)
 |    |-- ConnectionDeviceGenerationId: string (nullable = true)
 |    |-- EnqueuedTime: string (nullable = true)
 |    |-- StreamId: integer (nullable = true)
 |-- pk: string (nullable = true)
 |-- id: string (nullable = true)
 |-- _etag: string (nullable = true)
```

---

## Cell 2

### Code

```
display(df.limit(100))
```

---

## Cell 3

### Code

```
from pyspark.sql import functions as f

recent_df = df.select("pk","line_speed","temperature","humidity", "epoch").filter("epoch >= 1603986247").sort("epoch", ascending=False) 
display(recent_df.limit(10))
```
