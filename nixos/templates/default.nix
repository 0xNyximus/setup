{
    c = {
        path = ./c;
        description = "C development environment flake.";
    };

    python = {
        path = ./python;
        description = "Python development environment flake.";
    };

    default = {
        path = ./c;
        description = "Default template.";
    };
}
