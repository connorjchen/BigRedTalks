const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    _id: {
        type: String,
        required: true
    },
    username: {
        type: String,
        default: _id.split('@')[0]
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

UserSchema.virtual('email').get(() => {
    return this._id;
});

module.exports = mongoose.model('Users', UserSchema);