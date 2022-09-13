# encoding: UTF-8


module NewCliTest
  test "Une addition doit retourner le bon résultat." do |t|
    when_run 'expr 2 + 2'
    resultat_is 4
    pre_check do 
      Should.equal(4 + 4, 8, "4 + 4")
      4 + 4 == 8 || 
        raise("4 plus 4 n'est pas égal à 7")
    end
  end

  test "Un echo doit retourner le bon texte" do |t|
    when_run 'echo "bonjour tout le monde !"'
    with_inputs ['2','2']
    resultat_is do |t|
      t.value = "bonjour tout le monde !"
    end
  end
end
