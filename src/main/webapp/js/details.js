function checkDetails(form)
{
    if(form.days.value >7) 
    {
        alert("Error: number of days must be less than or equal to 7");
        form.days.focus();
        return false;
    } 
    if(form.teachers.value <form.class.value) 
    {
      alert("Error: number of teachers must be atleast equal to number of classes");
      form.teachers.focus();
      return false;
    }
    if(form.teachers.value <form.subjects.value) 
    {
      alert("Error: number of teachers must be atleast equal to number of subjects");
      form.teachers.focus();
      return false;
    }
    if((form.lectures.value*form.days.value) < (form.subjects.value*form.lecturespersub.value)) 
    {
      alert("Error:For successful results please ensure that number of total available lectures in a week exceeds the sum of number of lectures for each subject");
      return false;
    }
    return true;
  }
  