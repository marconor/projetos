# NYC Táxi Trips
Solução desenvolvida para o teste técnico de engenharia de dados na Datasprint. 
# Pré-requisitos
Powerbi
Jupyter Notebook - Python 3
Amazon S3
Amazon RedShift
# Passos
Efetuei a criação de uma conta na AWS para utilização do Bucket S3 para armazenagem dos arquivos e subir um cluster do Redshift.
Devido as limitações da conta free da AWS, tive que realizar a conversão dos arquivos Json fornecidos, para o formato CSV .
O primeiro passo para realizar a conversão foi criar uma rotina em python para adequar os arquivos json em uma formatação que permitisse a posterior conversão para CSV.
Para efetuar o ajuste, basta abrir o programa "ajuste_json.py" no Jupyter Notebook, parametrizar o arquivo json de origem, o arquivo de destino do novo json e rodar o programa.
Um novo arquivo json será gerado, com a formatação adequada para conversão em CVS. Após a criação json abrir o programa "converte_csv.py" ,paremetrizar qual arquivo json será exportado e parametrizar o arquivo csv onde será importado o conteúdo do json.
