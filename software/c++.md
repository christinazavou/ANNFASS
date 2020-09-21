Every C++ library has "include" and "lib"

In the opengl files we care about the "lib" folder

".dll" is used for dynamic linking
".lib" is used for static linking

So in my new C++ project I can make a folder named "Dependencies" and in there include the folder "include" and the folder "lib-vc2019" of the glfw i downloaded. (I can remove .dll files if i only want to use static linking)

So in VS i can open configurations, and in C++ -> General i can add an include dependency path ... then i could use in my code ```#include <GLFW/glfw.h>```

