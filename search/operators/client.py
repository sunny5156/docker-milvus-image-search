# Copyright (C) 2019-2020 Zilliz. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under the License.


import grpc
import operators.rpc_pb2 as pb
import operators.rpc_pb2_grpc as rpc_pb2_grpc


def identity(endpoint):
    try:
        with grpc.insecure_channel(endpoint) as channel:
            stub = rpc_pb2_grpc.OperatorStub(channel)
            res = stub.Identity(pb.IdentityRequest())
            return {
                "name": res.name,
                "endpoint": res.endpoint,
                "type": res.type,
                "input": res.input,
                "output": res.output,
                "dimension": res.dimension,
                "metric_type": res.metricType
            }
    except Exception as e:
        raise e


def health(operator):
    try:
        with grpc.insecure_channel(operator.endpoint) as channel:
            stub = rpc_pb2_grpc.OperatorStub(channel)
            res = stub.Healthy(pb.HealthyRequest())
            return res.healthy
    except Exception as e:
        raise e


def execute(operator, datas=[], urls=[]):
    try:
        options = [('grpc.max_send_message_length', 100 * 1024 * 1024),
                   ('grpc.max_receive_message_length', 100 * 1024 * 1024)]
        with grpc.insecure_channel(operator["endpoint"], options=options) as channel:
            stub = rpc_pb2_grpc.OperatorStub(channel)
            res = stub.Execute(pb.ExecuteRequest(urls=urls, datas=datas))
            return [list(x.element) for x in res.vectors], res.metadata
    except Exception as e:
        raise e
