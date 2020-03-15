#include <gtest/gtest.h>
#include "A/index.h"
#include "B/lib.h"

TEST(TEST_INDEX, test_index){
  EXPECT_EQ(1, n);
}

TEST(TEST_LIB, test_lib){
  for (int i = 0; i < 100; ++i){
    EXPECT_EQ(true, AlwaysTrue());
  }
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
