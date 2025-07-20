# 🐘 PostgreSQL Docker Playground

This repository contains a collection of Docker configurations for PostgreSQL, designed to help **DBAs** and **Database Reliability Engineers (DBREs)** quickly spin up PostgreSQL environments for testing, learning, and benchmarking.
Whether you're experimenting with replication, testing `pgbench`, or preparing for production-like scenarios, this project makes it easy to get started.

---

## ✨ Features - FOR NOW at least

- ✅ Multiple PostgreSQL instances with Docker Compose
- ✅ Ready-to-use configurations for **primary/replica streaming replication**
- ✅ Integration with `pgbench` for benchmarking
- ✅ Isolated environments for safe experiments
- ✅ Easy to extend for your custom use cases

---
```bash
## 🗂️ Repository Structure

postgres-docker-playground
├── docker-compose.yaml # Compose file to orchestrate all containers
├── primary
│ └── init
│ └── 01_configure_primary.sh
├── replica
│ └── init
│ └── 01_configure_replica.sh
├── Dockerfile # (Optional) Custom PostgreSQL image
├── .env # Environment variables (not committed)
└── README.md # You’re reading it 🙂
```
---

## 🚀 Getting Started

### 🔥 Requirements
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

### 📦 Clone this repository

```bash
git clone https://github.com/your-username/postgres-docker-playground.git
cd postgres-docker-playground

### 🏃‍♂️ Start the environment

docker compose up -d

This will start:

    PG_1: PostgreSQL primary on localhost:5433

    PG_2: PostgreSQL replica on localhost:5434

    PGBENCH: benchmarking container (ready for use)

🧪 Examples
Initialize replication

Run this command inside the PGBENCH container:

docker exec -it PGBENCH bash
pgbench -h PG_1 -U postgres -i testdb

Benchmark the primary

pgbench -h PG_1 -U postgres -c 10 -T 60 testdb

Benchmark the replica

pgbench -h PG_2 -U postgres -c 10 -T 60 testdb

📌 Notes

    Default credentials:

        Username: postgres

        Password: postgres

        Database: testdb

    Data persistence uses Docker volumes.

🙌 Contributing

Found a bug? Have an idea? Feel free to open issues or submit pull requests.
This project is made for DBAs/DBREs to experiment and share!