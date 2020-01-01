#ifndef PROXYCONFIG_H
#define PROXYCONFIG_H

#define CPPHTTPLIB_OPENSSL_SUPPORT
#include <httplib.h>

namespace ProxyConfig
{
    static int Test(
        std::string hostname,
        int port,
        std::string user,
        std::string pass
    )
    {
        try {
          httplib::SSLClient cli("www.malvados.com.br");

          if (!hostname.empty()) {
              cli.set_proxy(hostname.c_str(), port);

            if (!user.empty() && !pass.empty()) {
              cli.set_proxy_basic_auth(user.c_str(), pass.c_str());
            }
          }

          httplib::Result res = cli.Get("/");
          if (res != nullptr) {
              return res->status;
          }
        }
        catch (std::exception& e) {
            std::cout << e.what();
        }

        return 0;
    };
};

#endif
