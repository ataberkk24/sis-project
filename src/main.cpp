// Student Information System - command-line entry point.
//
// At this stage the program only prints usage and version information.
// The CRUD commands are implemented in later issues.

#include <iostream>
#include <string>

namespace {

void printUsage(std::ostream& out) {
    out << "Usage: sis <command> [options]\n"
           "\n"
           "Commands:\n"
           "  add     --id <id> --name <name> --surname <surname> --dept <dept> --email <email>\n"
           "  list\n"
           "  update  --id <id> [--name ..] [--surname ..] [--dept ..] [--email ..]\n"
           "  delete  --id <id>\n"
           "\n"
           "Options:\n"
           "  -h, --help      Show this help message\n"
           "  -v, --version   Show version information\n";
}

}  // namespace

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printUsage(std::cerr);
        return 1;
    }

    const std::string command = argv[1];

    if (command == "-h" || command == "--help") {
        printUsage(std::cout);
        return 0;
    }
    if (command == "-v" || command == "--version") {
        std::cout << "sis " << SIS_VERSION << '\n';
        return 0;
    }
    if (command == "add" || command == "list" || command == "update" || command == "delete") {
        std::cerr << "sis: command '" << command << "' is not implemented yet\n";
        return 2;
    }

    std::cerr << "sis: unknown command '" << command << "'\n\n";
    printUsage(std::cerr);
    return 1;
}
