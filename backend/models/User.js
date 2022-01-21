const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    _id: {
        type: String,
        required: true
    },
    username: {
        type: String,
        required: true
    },
    color: {
        type: String,
        default: "#22D7FF"
    },
    banned: {
        type: Boolean,
        default: false
    }
});

module.exports = mongoose.model('Users', UserSchema);