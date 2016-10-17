to_do = {
    admin: {
        pretty_name: 'Admin Tasks',
        tasks: {
            laundry: 15,
            dishes: 15,
            sweep: 15
        },
        rewards: [
            "Clean dishes",
            "Clean clothes", "Clean floor"
        ]
    },
    work: {
        pretty_name: 'Work',
        categories: {
            programming: 1,
            ACT: 1,
            SAT: 3,
            Essay_Writing: 1,
            Statistics: 1
        },
        students: [
            "Calvin", "Ernestine", "Sindy", "Richmond", "Portola", "Excelsior"
        ]
    },
}

#List all admin tasks
to_do[:admin][:tasks].keys

#List total number of students
to_do[:work][:students].length

#List work categories in order
to_do[:work][:categories].sort_by{|k,v| v}