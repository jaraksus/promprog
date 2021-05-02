#!/bin/bash

bazelisk build //FactoryMethod/cpp-source:FactoryMethod
bazelisk build //AbstractFactory/cpp-source:AbstractFactorySerializer
bazelisk build //Builder/cpp-source:Builder
bazelisk build //Prototype/cpp-source:Prototype
bazelisk build //Bridge/cpp-source:Bridge
bazelisk build //ChainResponsibility/cpp-source:ChainResponsibility
bazelisk build //Strategy/cpp-source:Strategy
bazelisk build //Observer/cpp-source:Observer
bazelisk build //Command/cpp-source:Command
bazelisk build //Mediator/cpp-source:Mediator
bazelisk build //Memento/cpp-source:Memento
bazelisk build //State/cpp-source:State
bazelisk build //Visitor/cpp-source:Visitor

bazelisk build //Adapter/cpp-source:Adapter
bazelisk build //Composite/cpp-source:Composite
bazelisk build //Decorator/cpp-source:Decorator

bazelisk build //Facade/cpp-source:Facade