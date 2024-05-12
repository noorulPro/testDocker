module Main 

using Oxygen, HTTP

# import your file with your custom module.
include("./Utils.jl")
# Make sure to import your module with a "." char in front, this tells julia it's a custom module
using .Utils

# Use a POST request route, because we need to send data t our api 
@post "/data" function(request)

    # extract the body of a HTTP Request and parse it to a JSON object 
    json_body = json(request)

    # extract the values inside the "data" key of our body
    data = json_body["data"]

    # call the external "sum_values" function with the "data" passed inside the body of the request
    return sum_values(data)
end

@get "/" function(req::HTTP.Request)
    return Dict("message" => "hello!", "value" => 99.3)
end

# start the server
serve(host = "0.0.0.0" , port=80) # but on browser http://127.0.0.1:8090/docs  - can be access

end