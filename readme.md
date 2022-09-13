# NewCliTest

Pour tester des applications en ligne de commande, avec interaction de l'utilisateur, aussi simplement que :

~~~ruby
# Test sans interaction
module NewCliTest

  test "Mon premier test" do
    when_run 'expr 2 + 2'
    resultat_is 4
  end

end #/module
~~~

Ou : 

~~~ruby
# Test avec interaction
module NewCliTest

  test "Mon premier test avec interaction" do
    when_run 'whats_your_name'
    with_inputs ['Phil']
    resultat_is "Hello Phil!"
  end

end #/module
~~~
