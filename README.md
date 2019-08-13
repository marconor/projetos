# NYC Táxi Trips
Solução desenvolvida para o teste técnico de engenharia de dados na Datasprint. 
# Pré-requisitos

Powerbi;

Jupyter Notebook - Python 3;

Amazon S3; 

Amazon RedShift;

# Passos
# 1 - Ajuste dos Arquivos
Efetuei a criação de uma conta na AWS para utilização do Bucket S3 para armazenagem dos arquivos e subir um cluster do Redshift.
Devido as limitações da conta free da AWS e meu recente contato com AWS, realizei a conversão dos arquivos Json fornecidos, para o formato CSV .

O primeiro passo para realizar a conversão foi criar uma rotina em python para adequar os arquivos json em uma formatação que permitisse a posterior conversão para CSV.

Para efetuar o ajuste, basta abrir o programa "ajuste_json.py" no Jupyter Notebook, parametrizar o arquivo json de origem, o arquivo de destino do novo json e rodar o programa.

Um novo arquivo json será gerado, com a formatação adequada para conversão em CSV. Após a criação json abrir o programa "converte_csv.py" ,paremetrizar qual arquivo json será exportado e parametrizar o arquivo csv onde será importado o conteúdo do json.

# 2 - Importar para o Bucket S3
Ajustados os 4 arquivos json, foi feita a importação dos arquivos para o Bucket S3.
Para o teste foram disponbilizados também arquivos csv com informações de Vendors e Payments, que foram importados para o S3 respectivamente como dvendor.csv e dpayment.csv (Dimensões).
Caminho dos arquivos :

s3://marconor/dpayment.csv;

s3://marconor/dvendor.csv;

s3://marconor/export2009.csv;

s3://marconor/export2010.csv;

s3://marconor/export2011.csv;

s3://marconor/export2012.csv;

# 3 - Modelagem dos dados
Para esse teste resolvi adotar o modelo dimensional, onde os jsons serão importados para uma tabela fato. Foram criadas 3 dimensões, a dimensão de tempo, dimensão de Vendors e dimensão de Payments.
O Data Warehouse foi criado do banco de dados Redshift (redshift-cluster-1.cqucvpjudrij.us-east-1.redshift.amazonaws.com:5439).
As seguintes tabelas foram criadas no Schema Public:

dim_calendar (dimensão);

dim_vendor (dimensão);

dim_payment (dimensão);

stg_trips (staging area);

ftrips (tabela fato);

Os scripts para criação das tabelas estão no arquivo 'scrips.sql' .

# 4 - Carga dos dados na Staging Area 
Uma vez que os arquivos estão no Bucket S3, foi feita a carga dos arquivos para suas respectivas tabelas através do comando COPY no Query Editor do Redshift.

copy public.stg_trips from 's3://marconor/export2009.csv' CREDENTIALS 'aws_access_key_id=xxxxx;aws_secret_access_key=xxxx' delimiter ',' removequotes;

copy public.stg_trips from 's3://marconor/export2010.csv' CREDENTIALS 'aws_access_key_id=xxxxx;aws_secret_access_key=xxxx' delimiter ',' removequotes;

copy public.stg_trips from 's3://marconor/export2011.csv' CREDENTIALS 'aws_access_key_id=xxxxx;aws_secret_access_key=xxxxx' delimiter ',' removequotes;

copy public.stg_trips from 's3://marconor/export2012.csv' CREDENTIALS
'aws_access_key_id=xxxx;aws_secret_access_key=xxxxxx' delimiter ',' removequotes;

# 5 - Carga dos dados nas tabelas Dimensão

copy public.dim_vendor from 's3://marconor/dvendor.csv' CREDENTIALS 'aws_access_key_id=xxxxx;aws_secret_access_key=xxxxxx' delimiter ',' removequotes;

copy public.dim_payment from 's3://marconor/dpayment.csv' CREDENTIALS 'aws_access_key_id=xxxxx;aws_secret_access_key=xxxxx' delimiter ',' removequotes;

A tabela dim_calendar foi criada e populada através do script 'scripts.sql'.

# 6 - Tranformação e carga na tabela Fato
O processo de carga da tabela fato foi feito através do script 'carga fato.sql'.

# 7-Powerbi (Dashboards dos requisitos do teste)
Foram publicados os gráficos no seguinte link:
https://app.powerbi.com/view?r=eyJrIjoiNjM4MDk4ZjctYWZkMy00MmYwLWFiM2YtMjY0YTllNmE4NDQ2IiwidCI6ImRkMDk4NWYxLTE5NDgtNDUwMy05YjlhLTYxYTgwMzMxYWI1MyJ9

# 8 - Quisitos enviados para análise:
  # Mínimos:
  1. Qual a distância média percorrida por viagens com no máximo 2 passageiros; (Dashboard)
  
  2. Quais os 3 maiores vendors em quantidade total de dinheiro arrecadado; (Dashboard)
  
  3. Faça um histograma da distribuição mensal, nos 4 anos, de corridas pagas em dinheiro; (Dashboard)
  
  4. Faça um gráfico de série temporal contando a quantidade de gorjetas de cada dia, nos últimos 3 meses de 2012. (Dashboard)
  
  # Bônus :
  1. Qual o tempo médio das corridas nos dias de sábado e domingo; (Dashboard)
  
  2. Conseguir provisionar todo seu ambiente em uma cloud pública, de preferência AWS. (AWS) 

  

  









