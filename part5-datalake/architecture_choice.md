## Architecture Recommendation

For a fast-growing food delivery startup collecting GPS location logs, customer text reviews, payment transactions, and restaurant menu images, I would recommend a **Data Lakehouse architecture**.

A Data Lakehouse combines the flexibility of a Data Lake with the performance and structure of a Data Warehouse, making it ideal for handling diverse data types.

First, the startup collects multiple forms of data such as structured data (payment transactions), semi-structured data (GPS logs and JSON data), and unstructured data (text reviews and images). A Data Lakehouse can store all these formats in a single scalable storage system, unlike traditional data warehouses that mainly support structured data.

Second, the business will need real-time analytics and reporting to understand customer behavior, delivery performance, and restaurant popularity. A Data Lakehouse supports high-performance SQL analytics similar to a data warehouse while still allowing raw data storage like a data lake.

Third, as the startup grows rapidly, scalability and cost efficiency become important. Data Lakehouses are built on distributed storage systems that allow the company to store large volumes of data at lower cost while still maintaining data governance and query performance.

Therefore, a Data Lakehouse provides the best balance of flexibility, scalability, and analytical capability for a modern data-driven food delivery platform.
