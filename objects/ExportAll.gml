#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
text="Export All"
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
format=show_message_ext("Please select the export format.","Model","G3Z","Bundle")

if (format==0) exit

if (format==3) {
    fn=get_save_filename("G3B Model Bundle|*.g3b","model")
    if (fn="") exit
    bundle=d3d_model_bundle_create()
    i=0 repeat (Controller.modelc) {
        mat=Controller.models[i,3]
        if (mat>=0) bg=Controller.mats[mat,1] else bg=noone
        d3d_model_bundle_add(bundle,Controller.models[i,0],bg)
    i+=1}
    d3d_model_bundle_save(bundle,filename_change_ext(fn,".g3b"))
    d3d_model_bundle_destroy(bundle)
} else {
    var dir; dir=get_directory_alt("Save all models to this folder.","")
    if (dir=="") exit
    if (string_pos("\/",string_char_at(dir,string_length(dir)))==0) dir+="/"
    for (m=0;m<Controller.modelc;m+=1) {
        var o,g,mat;
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

        if (format==2) d3d_model_save_g3z(Controller.models[m,0],dir+"/"+filename_change_ext(fn,".g3z"))
        else d3d_model_save(Controller.models[m,0],dir+"/"+filename_change_ext(fn,".g3d"))
    }
}
