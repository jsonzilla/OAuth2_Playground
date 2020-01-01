#include "gtest/gtest.h"

#include "ProxyConfig.h"

// test ProxyConfig::Test
TEST(ProxyConfig, deve_funcionar_sem_proxy_algum)
{
    EXPECT_EQ(200, ProxyConfig::Test("", 0, "", ""));
}

TEST(ProxyConfig, nao_deve_funcionar_com_proxy_inexiste)
{
    EXPECT_EQ(0, ProxyConfig::Test("proxy.altoqi.com.br", 8080, "", ""));
}


int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}