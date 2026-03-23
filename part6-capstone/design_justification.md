## Storage Systems
For this architecture, three distinct storage systems were selected to optimize for specific data requirements:

Data Lake (Raw Storage): This acts as the landing zone for all high-volume, high-velocity data, especially from ICU Monitoring Devices and Doctor Notes. It is chosen because it can store unstructured and semi-structured data at a low cost, ensuring no data is discarded before it is understood.

Data Warehouse (Reporting Data): This system is utilized for Billing & Costs and structured Patient Records. It is optimized for complex SQL queries and historical analysis, serving as the "single source of truth" for the BI Reports used by hospital management.

Vector Database (Semantic Search): Specifically chosen to handle the Doctor Notes and Treatment History. By storing data as high-dimensional vectors, it enables the NLP Search functionality, allowing doctors to query patient history using natural language rather than rigid keyword searches.

## OLTP vs OLAP Boundary
The boundary between the Online Transactional Processing (OLTP) and Online Analytical Processing (OLAP) systems occurs at the ETL & Streaming (Kafka) layer.

The Data Sources (Patient Records, ICU Devices) represent the OLTP side, where the primary focus is on data entry and real-time clinical operations. Once the data passes through Kafka into the Data Lake and Warehouse, it enters the OLAP environment. Here, the data is no longer being "mutated" by daily hospital operations; instead, it is being transformed and aggregated to support long-term decision-making and predictive modeling (Readmission Prediction).

## Trade-offs
A significant trade-off in this design is Architectural Complexity vs. Data Specialization. By using three different storage backends (Lake, Warehouse, and Vector DB), we introduce "polyglot persistence."

The Risk: Maintaining three separate systems increases the overhead for the IT team, creates potential data consistency issues, and increases costs.

Mitigation: To mitigate this, I would implement a Unified Metadata Layer (like a Data Catalog). This ensures that a patient ID in the Vector Database matches the same patient in the Data Warehouse. Additionally, using a managed "Data Lakehouse" approach could eventually consolidate the Lake and Warehouse to reduce the number of moving parts without sacrificing the specialized search capabilities of the Vector DB.
