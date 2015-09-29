var bob = {
    firstName: 'Bob',
    lastName: 'Jones',
    phoneNumber: '(650) 777-7777',
    email: 'bob.jones@example.com'
};

var mary = {
    firstName: 'Mary',
    lastName: 'Johnson',
    phoneNumber: '(650) 888-8888',
    email: 'mary.johnson@example.com'
};

var contacts = [bob, mary];

function printPerson(person) {
    'use strict';
    console.log(person.firstName + ' ' + person.lastName);
}

function list() {
    'use strict';
    var contactsLength = contacts.length;
    for (var i = 0; i < contactsLength; i++) {
        printPerson(contacts[i]);
    }
}

/*Create a search function
then call it passing 'Jones'*/
function search(lastName){
    'use strict';
    var contactsLength = contacts.length;
    for (var i = 0; i < contactsLength; i++) {
        if(lastName===contacts[i].lastName){
            printPerson(contacts[i]);
        }
    } // end for
} // end function


function add(firstName, lastName, email, phoneNumber){
    'use strict';
    contacts[contacts.length] = {
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email
    };
}

add('Emily', 'Tone', 'some@email.com', 'I really should know that');
list();
