# NYC Táxi Trips
Solução desenvolvida para o teste técnico de engenharia de dados na Datasprint. 
# Pré-requisitos
Powerbi;
Jupyter Notebook - Python 3;
Amazon S3; 
Amazon RedShift;
# Passos
Efetuei a criação de uma conta na AWS para utilização do Bucket S3 para armazenagem dos arquivos e subir um cluster do Redshift.
Devido as limitações da conta free da AWS e meu recente contato com AWS, realizei a conversão dos arquivos Json fornecidos, para o formato CSV .
O primeiro passo para realizar a conversão foi criar uma rotina em python para adequar os arquivos json em uma formatação que permitisse a posterior conversão para CSV.
Para efetuar o ajuste, basta abrir o programa "ajuste_json.py" no Jupyter Notebook, parametrizar o arquivo json de origem, o arquivo de destino do novo json e rodar o programa.
Um novo arquivo json será gerado, com a formatação adequada para conversão em CSV. Após a criação json abrir o programa "converte_csv.py" ,paremetrizar qual arquivo json será exportado e parametrizar o arquivo csv onde será importado o conteúdo do json.
Ajustados os 4 arquivos json, foi feita a importação dos arquivos para o Bucket S3.
Para o teste foram disponbilizados também arquivos csv com informações de Vendors e Payments, que foram importados para o S3 respectivamente como dvendor.csv e dpayment.csv (Dimensões).
Caminho dos arquivos :
s3://marconor/dpayment.csv;
s3://marconor/dvendor.csv;
s3://marconor/export2009.csv;
s3://marconor/export2010.csv;
s3://marconor/export2011.csv;
s3://marconor/export2012.csv;
Para esse teste resolvi adotar o modelo dimensional, onde os jsons serão importados para uma tabela fato. Foram criadas 3 dimensões, a dimensão de tempo, dimensão de Vendors e dimensão de Payments.
O Data Warehouse foi criado do banco de dados Redshift (redshift-cluster-1.cqucvpjudrij.us-east-1.redshift.amazonaws.com:5439).
As seguintes tabelas foram criadas no Schema Public:
dim_calendar (dimensão);
dim_vendor (dimensão);
dim_payment (dimensão);
stg_trips (staging area);
ftrips (tabela fato);







