#include <cassert>
#include <greeter/greeter.hpp>

int main() {
  assert(make_greeting("Hannes") == "Hello, Hannes!");
}
