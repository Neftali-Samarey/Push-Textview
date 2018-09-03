# Push-Textview

<p align="center">
  <img src="https://github.com/Neftali-Samarey/Push-Textview/blob/master/screenshots/PushTextviewPreview.png" width="340" title="hover text">
</p>
<p>
  <h2>About</h2>
  <span>An app that uses an instance of <b>UITextField</b> </span> using storyboard Autolayout constraints. Main idea behind
  this sample project is to enable the Textview's bottom anchor to raise above the keyboard when the user selects the textfield to type.<i>(not doing so hides text content behind keyboard)</i>
  The way this is achieved is by 1st determining the size of the keyboard (assuming various screen sizes have different keyboard height).
  Then the 2nd step is to update the constant of the bottom textfield constraint to that of the top anchor of the raising keyboard.
  <br /><br />
  This keeps the textfield right above the keyboard when the user types. When selecting the parent <b>UIView</b>, the keyboard dimisses itself
  and the bottom textfield anchor resumes its original positon at 0. <br /><br />
  
</p>
