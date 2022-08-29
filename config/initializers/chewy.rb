Chewy.settings = { host: ENV.fetch('ELASTICSEARCH_URL', 'elasticsearch:9200') }
Chewy.strategy(:atomic)