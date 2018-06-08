@load Apache/Kafka/logs-to-kafka

redef Kafka::topic_name = "bro-raw";
redef Kafka::json_timestamps = JSON::TS_ISO8601;
redef Kafka::tag_json = F;
redef Kafka::kafka_conf = table(
    ["metadata.broker.list"] = "127.0.0.1:9092"
);
