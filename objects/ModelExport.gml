#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
text="Export"
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mouse_y<100) exit
var o,g,mat;

g3z=show_message_ext("Please select the export format.","G3D","G3Z","Cancel")

if (g3z==0 or g3z==3) exit

g3z=(g3z==2)


o=Controller.models[m,1]
g=Controller.models[m,2]
mat=Controller.models[m,3]
var fn; fn=""
if (o!="") {
    fn+=o
    if (g!="" || mat>=0) fn+="_"
}
if (g!="") {
    fn+=g
    if (mat>=0) fn+="_"
}
if (mat>=0) {
    fn+=Controller.mats[mat,0]
}
if (fn=="") fn="model"
if (g3z) {
    var fn; fn=get_save_filename("Packed GM Model|*.g3z",fn)
    if (fn=="") exit
    d3d_model_save_g3z(Controller.models[m,0],filename_change_ext(fn,".g3z"))
} else {
    var fn; fn=get_save_filename("Game Maker model|*.g3d",fn)
    if (fn=="") exit
    d3d_model_save(Controller.models[m,0],filename_change_ext(fn,".g3d"))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y<-20 || y>room_height+80) exit
var o,g,mat;
o=Controller.models[m,1]
g=Controller.models[m,2]
mat=Controller.models[m,3]
var Y; Y=y-20*((o!="")+(g!="")+(mat>=0))
draw_set_halign(fa_right)
if (o!="") {
    draw_text(room_width-4,Y,"o:"+o)
    Y+=20
}
if (g!="") {
    draw_text(room_width-4,Y,"g:"+g)
    Y+=20
}
if (mat>=0) {
    draw_text(room_width-4,Y,"m:"+Controller.mats[mat,0])
}
draw_set_halign(fa_left)
event_inherited()
