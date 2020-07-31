#include <greeter/greeter.hpp>

#include <sstream>

std::string make_greeting(std::string_view name)
{
  std::ostringstream oss{};
  oss << "What's up, " << name << '?';
  return oss.str();
}
