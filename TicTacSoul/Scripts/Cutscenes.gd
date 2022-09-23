extends Node2D

#Imagens da cutscene
var image = preload("res://Sprites/HQ1.png")
var image2=preload("res://Sprites/HQ2.png")
var image3= preload("res://Sprites/HQ3.png")
var images=[image,image2,image3]

#Conta qual a imagem deve ser mostrada
onready var imagem_contador=0;
#Inicia a cutscene com a primeira imagem
func _ready():
	$Images.texture=image;
	$Prev.visible=false
	#Caso a cutscene esteja desligada, não a toque e mande o usuario para o jogo diretamente
	if(Dificuldade.get_cutscene_state()==Dificuldade.Cutscene.OFF):
		get_tree().change_scene("res://Scenes/GameScene.tscn") 


#Ao pressionar o botão de escapar, pula para o jogo sem desativar a cutscene
func _on_Skip_pressed():
	get_tree().change_scene("res://Scenes/GameScene.tscn")
	pass # Replace with function body.

#Ao pressionar o botão de voltar, volta a imagem da tela
func _on_Prev_pressed():
	#Se não tiver imagens antes, não é necessário mostrar o botão previous
	if(imagem_contador==1):
		$Prev.visible=false 
		imagem_contador-=1; 
		$Images.texture=images[imagem_contador]
	elif(imagem_contador>=1):
		#Se o contador for maior que zero, há imagens antes
		imagem_contador-=1; 
		$Images.texture=images[imagem_contador]
	pass # Replace with function body.
	
	
#Ao pressionar o botao de next, ir para a proxima imagem do vetor de imagens incrementando o contador de imagem
#Caso ultrapassar o limite de imagens, ir para o jogo
func _on_Next_pressed():
	if(imagem_contador>=images.size()-1):
		Dificuldade.set_difficulty(Dificuldade.Cutscene.OFF)
		get_tree().change_scene("res://Scenes/GameScene.tscn")
	elif(imagem_contador<images.size()):
		$Prev.visible=true;
		imagem_contador+=1
		$Images.texture=images[imagem_contador]
	pass # Replace with function body.

#Ao passar por cima dos botoes, tocar o som dos mesmos
func _on_Prev_mouse_entered():
	$RockButton.play()
	pass # Replace with function body.


func _on_Skip_mouse_entered():
	$RockButton.play()
	pass # Replace with function body.


func _on_Next_mouse_entered():
	$RockButton.play()
	pass # Replace with function body.
