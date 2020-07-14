CREATE DATABASE IF NOT EXISTS dinterminal;
CREATE USER 'dinterminal' identified by '';
GRANT ALL PRIVILEGES ON dinterminal.* TO 'dinterminal';
GRANT ALL PRIVILEGES ON dinterminal.* TO 'root';

CREATE DATABASE IF NOT EXISTS di_payments;
CREATE USER 'di_payments' identified by '';
GRANT ALL PRIVILEGES ON di_payments.* TO 'di_payments';
GRANT ALL PRIVILEGES ON di_payments.* TO 'root';

CREATE DATABASE IF NOT EXISTS di_financials;
CREATE USER 'di_financials' identified by '';
GRANT ALL PRIVILEGES ON di_financials.* TO 'di_financials';
GRANT ALL PRIVILEGES ON di_financials.* TO 'root';

CREATE DATABASE IF NOT EXISTS dinterminal_documents;
CREATE USER 'dinterminal_documents' identified by '';
GRANT ALL PRIVILEGES ON dinterminal_documents.* TO 'dinterminal_documents';
GRANT ALL PRIVILEGES ON dinterminal_documents.* TO 'root';
