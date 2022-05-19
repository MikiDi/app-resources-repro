# mu-cl-resources quirk reproduction

- Create a resource through mu-cl-resources, but don't specify all properties
- Update one of the properties you didn't set through a sudo query in a backend service
- `GET` the resources you created originally and observe that the property you set through the backend service still isn't visible, although you expected it to be, because resources receives deltas


repro:

```
drc up -d
./test.sh
```