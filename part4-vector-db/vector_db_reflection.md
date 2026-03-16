## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system where lawyers search long contracts using natural language questions. Keyword search only matches exact words or phrases in the document. However, legal documents often use complex language, synonyms, and different ways of expressing the same idea. For example, a lawyer might ask “What are the termination clauses?” but the contract might use terms like “agreement cancellation conditions” or “contract ending provisions.” A keyword search might fail to retrieve these sections because the exact words do not match.

A vector database solves this problem by using embeddings that capture the semantic meaning of text. Instead of storing plain text, the system converts contract sections and user queries into numerical vectors using embedding models. These vectors represent the meaning of the text in a multi-dimensional space.

When a lawyer asks a question in plain English, the system converts the query into an embedding and searches for the most similar vectors in the database using similarity measures such as cosine similarity. This allows the system to retrieve relevant sections of the contract even if the wording is different.

Therefore, a vector database enables semantic search, making it possible to find meaningful answers within large documents like 500-page contracts quickly and accurately.
