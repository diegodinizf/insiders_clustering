# variable
data=$(date +'%Y-%m-%d')

# path
path='C:\\Users\diego\OneDrive\Área de Trabalho\projects\insiders_clustering'
path_to_envs='/c/Users/diego/anaconda3/Scripts'

$path_to_envs/papermill $path/src/models/insiders_clustering_deploy.ipynb $path/reports/insiders_clustering_deploy_$data.ipynb