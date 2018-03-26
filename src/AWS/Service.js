'use strict';

const awsSdk = require("aws-sdk");

exports.serviceImpl = function(serviceName) {
    return function(options) {
        return function () {
            return new awsSdk[serviceName](options);
        };
    };
};
