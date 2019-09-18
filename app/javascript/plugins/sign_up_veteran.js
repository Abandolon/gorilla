const signupVeteran = () => {
  const element = document.querySelector(".additional-veteran-info");
  const radioBtnVet = document.querySelector('#user_veteran_true');
  const radioBtnStarter = document.querySelector('#user_veteran_false');
  if(element) {
    const showVeteran = () => {
      if (element.style.display === "none") {
        element.style.display = "block";
      }
    }

    const hideAdditionalVeteranInfo = () => {
      element.style.display = "none";
    }

    radioBtnVet.addEventListener('click', showVeteran);
    radioBtnStarter.addEventListener('click', hideAdditionalVeteranInfo);

  }

}
export {signupVeteran};
