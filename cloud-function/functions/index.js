const functions = require('firebase-functions');

let admin = require('firebase-admin')
admin.initializeApp(functions.config().firebase)


exports.announceProduct = functions.database.ref("/users/{userID}").onCreate( (snapshot,context) => {
    var user = snapshot.val()
    let email = user.email
    let number = user.number
    let imageUrl = String(user.imageUrl)

    let payload = {
        notification : {
            title : "New User",
           body : 'With email '+ email + 'and number ' + number,
            sound : 'default',
           mutable_content : 'TRUE'
        },
        data : {
            ImageUrl : imageUrl
        }
    }
    console.log(payload)
    let topic = "userList"
    admin.messaging().sendToTopic(topic,payload)
    
})
