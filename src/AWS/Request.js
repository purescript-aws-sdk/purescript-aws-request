'use strict';

const awsSdk = require("aws-sdk");

exports.requestImpl = function(serviceName) {
  return function(methodName) {
    return function(params) {
      return function (onError, onSuccess) {
        const awsService = new awsSdk[serviceName];
        awsService[methodName](params, function(err, data) {
          if (err === null) onSuccess(data);
          else              onError(err);
        });
      };
    };
  };
};
