function view(packId) {
      
    alert("This is where the other action details will be at " + packId);
  }
  
  function popup() {
    document.getElementById("newPackPopup").style.display = "block";
    document.getElementById("over").style.display = "block";
  }
  
  function closePopup() {
    document.getElementById("newPackPopup").style.display = "none";
    document.getElementById("over").style.display = "none";
  }
  
  function submit() {
    // Add more for package
    alert("Form submitted. Thank you!");
    closePopup();
  }
  
  function clearForm() {
    document.getElementById("newPackForm").reset();
  }