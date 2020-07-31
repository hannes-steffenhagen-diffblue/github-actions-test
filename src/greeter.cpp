#include <greeter/greeter.hpp>

#include <sstream>

std::string make_greeting(std::string_view name)
{
  std::ostringstream oss{};
  oss << "Hello, " << name << '!';
  return oss.str();
}
