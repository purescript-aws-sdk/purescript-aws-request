'use strict';

const awsSdk = require("aws-sdk");

exports.requestImpl = function(service) {
  return function(methodName) {
    return function(params) {
      return function (onError, onSuccess) {
        service[methodName](params, function(err, data) {
          if (err === null) onSuccess(data);
          else              onError(err);
        });
      };
    };
  };
};
