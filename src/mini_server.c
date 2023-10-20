#include <stdio.h>
#include <fcgiapp.h>

int main() {
    FCGX_Init();
    int sockfd = FCGX_OpenSocket("127.0.0.1:8080", 1024);
    FCGX_Request req;
    FCGX_InitRequest(&req, sockfd, 0);

    while (FCGX_Accept_r(&req) == 0) {
        FCGX_FPrintF(req.out, "Content-Type: text/html\r\n\r\n");
        FCGX_FPrintF(req.out, "Hello, World!\n");
        FCGX_Finish_r(&req);
    }
    return 0;
}
