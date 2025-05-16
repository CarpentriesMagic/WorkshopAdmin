{% comment %}
SPECIAL REQUIREMENTS

Modify the block below if there are any special requirements.
{% endcomment %}
<p id="requirements">
  <strong>Requirements:</strong>
  {% if online == "false" %}
    PCs and an online environment will be provided but participants are welcome to bring their own laptop with a
    Mac, Linux, or Windows operating system (not a tablet, Chromebook, etc.) that they have administrative privileges on.
  {% else %}
    Participants must have access to a computer with a
    Mac, Linux, or Windows operating system (not a tablet, Chromebook, etc.) that they have administrative privileges on.
  {% endif %}
  In in order to continue working after the course, they should have a few specific software packages installed (listed <a href="#setup">below</a>). 
  <br>
  Note for members of Newcastle University: Software should be installed from Software Center on Newcastle University managed Windows PCs and laptops. In case of difficulty please log a ticket to it.servicedesk@ncl.ac.uk and let us know at the contact details below if you still need help.
</p>

{% comment %}
ACCESSIBILITY

Modify the block below if there are any barriers to accessibility or
special instructions.
{% endcomment %}

<p>
<strong>Accessibility:</strong>
  {% if online == "false" %} We are committed to making this workshop accessible to everybody. For workshops at a physical location, the workshop organizers have checked that:

The room is wheelchair / scooter accessible.
Accessible restrooms are available.
Materials will be provided in advance of the workshop and large-print handouts are available if needed by notifying the organizers in advance. If we can help making learning easier for you (e.g. sign-language interpreters, lactation facilities) please get in touch (using contact details below) and we will attempt to provide them.

{% else %} We are dedicated to providing a positive and accessible learning environment for all. Please notify the instructors in advance of the workshop if you require any accommodations or if there is anything we can do to make this workshop more accessible to you.
{% endif %}
</p>
<p>
  <a href="https://glosario.carpentries.org/">Glosario</a> is a multilingual glossary 
  for computing and data science terms. The glossary helps 
  learners attend workshops and use our lessons to make sense of computational and programming jargon written in English by offering it 
  in their native language. Translating data science terms also provides a teaching tool for Carpentries Instructors to reduce barriers 
  for their learners.
</p>

