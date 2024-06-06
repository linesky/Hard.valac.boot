extern void putss(char *c);
int main(){
    char c[]="\ec\e[43;37mhello world portable c compiler\n";
    putss(c);
    return 0;
}
