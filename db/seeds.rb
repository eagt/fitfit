Exercise.destroy_all
Etype.destroy_all
Muscle.destroy_all
Equipment.destroy_all

#I create variables for etypes (et 1 to10)
et1 = Etype.create({id: 1, name: "Strength"}) 
et2 = Etype.create({id: 2, name: "Cardio"})
et3 = Etype.create({id: 3, name: "Stretching"})

#I create variables for exercise (et 1 to 5)

ex1 = Exercise.create({id: 1, name: "Arms U", description: "Testing arms up for 1h"})
ex2 = Exercise.create({id: 2, name: "Arms Down ", description: "More testing"})
ex3 = Exercise.create({id: 3, name: "Lateral side Gluteus ", description: "Kick lateral until then"})
ex4 = Exercise.create({id: 4, name: "Back strecth ", description: "Jump on your back"})
ex5 = Exercise.create({id: 5, name: "Legs Up ", description: "Feet looking at your eyes"})

eq1 = Equipment.create({id: 1, name: "Flat bench"})
eq2 = Equipment.create({id: 2, name: "Body only"})
eq3 = Equipment.create({id: 3, name: "Cable"})
eq4 = Equipment.create({id: 4, name: "Elastic band"})

mu1 = Muscle.create({id: 1, name: "Biceps"})
mu2 = Muscle.create({id: 2, name: "Triceps"})
mu3 = Muscle.create({id: 3, name: "Gluteus"})
mu4 = Muscle.create({id: 4, name: "Quadriceps"})

#To create an exercise it will need to have the value for the etype, muscle and equipment columns. So this associations has to be created manually on the seed. 

ex1.etypes << et1
ex1.etypes << et2
ex1.equipment << eq1
ex1.muscles << mu1

ex2.etypes << et2
ex2.equipment << eq2
ex2.muscles << mu2

ex3.etypes << et3
ex3.equipment << eq3
ex3.muscles << mu3

ex4.etypes << et1
ex4.equipment << eq3
ex4.muscles << mu4

ex5.etypes << et3
ex5.equipment << eq2
ex5.muscles << mu3

# Will print the number of exercise created
p "Created #{Exercise.count} exercises"  
