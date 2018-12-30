// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function refreshForm(formHTML) {
  const newReviewForm = document.getElementById('new_comment');
  newReviewForm.innerHTML = formHTML;
}

function addComment(commentHTML) {
  const comments = document.getElementById('comments');
  comments.insertAdjacentHTML('beforeend', commentHTML);
}

function removeComment(commentId) {
  const comment = document.querySelector(`[data-comment="${commentId}"]`);
  comment.parentNode.removeChild(comment);
}

function displayError(errorHTML) {
  const formErrors = document.getElementById('form_errors');
  formErrors.innerHTML = errorHTML;
}

function hideError() {
  const formErrors = document.getElementById('form_errors');
  if(formErrors) {
    formErrors.innerHTML = "";
  }
}

function displayFlash(flashHTML) {
  const aboveFlash = document.getElementById('main-region');
  aboveFlash.insertAdjacentHTML('afterend', flashHTML);
}

function hideFlash() {
  const flashMessage = document.getElementById('flash_error');
  if(flashMessage) {
    flashMessage.parentNode.parentNode.removeChild(flashMessage.parentNode);
  }
}
