#include <iostream>

int main() {
    std::cout << "Hello IFC IO!" << std::endl;

#if UNI_PLATFORM_WINDOWS 
    system("pause");
#endif 

    return 0;
}