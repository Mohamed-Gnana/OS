

void print(char* message)
{
    // oxb8000 First byte that will be shown on screen
    static unsigned short* VideoMemory = (unsigned short*)0xb8000;

    for(int i = 0; message[i] != '\0'; ++i)
    {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | message[i];
    }
}

extern "C" void kernalMain(const void* multiboot_structure, unsigned int /*magicnumber*/)
{
    print("Hello World! --- http://www.gnana.com");

    while(1);
}
