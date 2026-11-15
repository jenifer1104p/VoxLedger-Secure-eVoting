# VoxLedger – Blockchain-Based eVoting System

An improved Eclipse-ready packaging of the supplied Java/JSP voting application. The original JSP/Servlet workflows and source packages are retained; the landing page has a responsive modern redesign.

## Stack
- Java 8, JSP, Java Servlets, JDBC
- MySQL (schema-only SQL supplied under `database/`)
- AWS Rekognition integration (optional; environment configuration required)
- Filebase S3-compatible storage and Ganache/Web3j integration (optional; environment configuration required)

## Import into Eclipse
1. Extract this ZIP.
2. In Eclipse choose **File → Import → Existing Projects into Workspace**.
3. Select the extracted `voting/voting` folder (the folder containing `.project`).
4. Configure a compatible JDK (Java 8) and Apache Tomcat 8.5/9 runtime.
5. Confirm the project is a **Dynamic Web Project** and that `WebContent` is the web root.
6. Ensure the JARs under `WebContent/WEB-INF/lib` are on the project build path.
7. Configure the environment variables below in the Tomcat server launch configuration.
8. Create a local MySQL database and import `database/schema-only.sql`.
9. Run on Server and open `/voting/`.

## Environment configuration
Copy `.env.example` as a reference; Eclipse/Tomcat does not automatically load `.env`. Set each value in **Run Configurations → Environment** or your operating system environment.

Required for database access: `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`. Defaults are localhost:3306, schema `studentvoute`, user `root`, and an empty password; set a dedicated least-privilege DB account and password for real use.

Optional integrations: configure AWS credentials using the standard AWS SDK credential provider chain (IAM role or local AWS profile) and `AWS_REKOGNITION_COLLECTION`. Configure Filebase and Ganache variables only if those integrations are enabled. Use a disposable Ganache account; never use a wallet containing real funds.

## Important changes in this package
- Removed hardcoded AWS, Filebase and Ethereum private-key literals from source files. **Treat the exposed credentials from the original archive as compromised and revoke/rotate them immediately.**
- Replaced the shared static JDBC connection with a new connection per call and environment-based DB settings.
- Removed stale compiled `.class` output so Eclipse rebuilds from source.
- Replaced the bundled SQL data export with a schema-only SQL file to avoid redistributing voter/candidate records and binary uploads. Import your own synthetic test data.
- Added a responsive modern landing page while retaining the original JSP portal routes.

## Known limitations – do not mistake packaging cleanup for a security certification
The legacy application still needs a full functional and security remediation pass. In particular, the original login handlers still compare plain-text passwords; several JSP pages perform database operations directly; authorization/session enforcement, CSRF protection, output encoding, duplicate-vote prevention, and transaction handling need systematic testing. The current blockchain page is not evidence of a complete Solidity smart-contract voting system. No smart contract source/deployment was present in the supplied archive. The facial-recognition flow must be server-enforced and must not expose ballot choices.

This project is suitable for local academic development with synthetic data only until these issues are fixed and independently reviewed. It is not suitable for conducting a real public election.
